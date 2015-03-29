#!/usr/bin/env ruby
# Author: c0r73x

require 'net/http'
require 'rexml/document'
require 'pty'

require_relative 'functions'

$HOME = `echo -n $HOME`
$ICONPATH = "#{$HOME}/.config/icons/xpm"
$stdout = STDOUT
$weather = $cpu = $mem = $date = $nf = $df = $vol = $mpd = $net = $pac = $bat = $mail = ""
@colors = Array.new()
@nets = Array.new()
$screen_width = `xrandr | /bin/grep '*'`.match(/\s(\d+)x/)[1].to_i
$dpi = `xdpyinfo | grep 'resolution:'`.match(/\s(\d+)x/)[1].to_i
$dpi = ($dpi<96) ? 96 : $dpi
$text_width = 5*($dpi/96)
$iconsize = 10*($dpi/96)
$monitor = ARGV[0]
$location = 12886294
#@tags = ['■ ','■ ','■ ','■ ','■ ']
@tags = ['x ','x ','x ','x ','x ']
$running = true
@thr = Array.new()

xrdb = `xrdb -query`
for i in 0..15
    getColor(xrdb,"color#{i}","#ffffff")
end

getColor(xrdb,"foreground","#ffffff")
getColor(xrdb,"background","#000000")

# CPU + Bandwith + Volume| 1 sec
@thr << Thread.new {
    begin
        previdle = prevtotal = 0
        while (true)
            c=(`cat /proc/stat`).lines.first.split(' ')

            idle = c[4].to_i
            total = 0
            for t in c[1..-1]
                total += t.to_i
            end

            diffidle = idle - previdle
            difftotal = total - prevtotal
            diffusage = (1000*(difftotal-diffidle)/(difftotal+5))/10

            prevtotal = total
            previdle = idle

            #l=(`cat /proc/loadavg`).split(' ')
            $cpu = "^fg(#{@colors[14]})#{@icons['cpu']} ^fg(#{@colors[15]})#{diffusage}%"

            # Bandwith
            outnet = ''
            @nets.each do |n|
                if n.ip
                    ul = `cat /sys/class/net/#{n.name}/statistics/tx_bytes`.to_i
                    dl = `cat /sys/class/net/#{n.name}/statistics/rx_bytes`.to_i

                    n.ul = toiB(ul - n.pul.to_i)
                    n.dl = toiB(dl - n.pdl.to_i)

                    n.pdl = dl
                    n.pul = ul

                    outnet += "^fg(#{@colors[14]})#{n.icon} ^fg(#{@colors[15]})#{n.ip} #{n.speed} ^fg(#{@colors[14]})#{@icons['net_up']} ^fg(#{@colors[15]})#{n.ul} ^fg(#{@colors[14]})#{@icons['net_down']} ^fg(#{@colors[15]})#{n.dl} "
                end
            end
            if outnet == ''
                $net = "^fg(#{@colors[14]})#{@icons['net_offline']} ^fg(#{@colors[7]})Offline "
            else
                extip = `dig +short myip.opendns.com @resolver1.opendns.com`.gsub(/\n/,'').to_s
                if extip =~ /servers/
                    extnet = "^fg(#{@colors[14]})wan: ^fg(#{@colors[7]})Offline "
                else
                    extnet = "^fg(#{@colors[14]})wan: ^fg(#{@colors[15]})#{extip} "
                end
                $net = "#{extnet}#{outnet}"
            end

            # Volume
            mute=`pamixer --get-mute`
            if mute =~ /true/
                $vol="^fg(#{@colors[14]})#{@icons['vol_mute']}^fg(#{@colors[7]}) MUTE "
            else
                sp = `pamixer --get-volume`.to_i
                si = ""

                if sp > 70
                    si = @icons['vol_100']
                elsif sp > 40
                    si = @icons['vol_70']
                elsif sp > 15
                    si = @icons['vol_40']
                else
                    si = @icons['vol_15']
                end

                $vol="^fg(#{@colors[14]})#{si}^fg(#{@colors[15]}) #{sp}% "
            end

            #mixer=getMixer
            #stat=`amixer sget #{mixer} | tail -n1`
            #if stat =~ /\[on\]/
            #sp = stat.match(/\[(\d+)%\]/)[1].to_i
            #si = ""

            #if sp > 70
            #si = @icons['vol_100']
            #elsif sp > 40
            #si = @icons['vol_70']
            #elsif sp > 15
            #si = @icons['vol_40']
            #else
            #si = @icons['vol_15']
            #end

            #$vol="^fg(#{@colors[14]})#{si}^fg(#{@colors[15]}) #{sp}% "
            #else
            #$vol="^fg(#{@colors[14]})#{@icons['vol_mute']}^fg(#{@colors[7]}) MUTE "
            #end

            sleep(1)
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
    end
}

# Memory | 3 sec
@thr << Thread.new {
    begin
        while(true)
            mt=(`grep MemTotal /proc/meminfo`).split(' ')[1]
            mf=(`grep MemFree /proc/meminfo`).split(' ')[1]
            mb=(`grep Buffers /proc/meminfo`).split(' ')[1]
            mc=(`grep Cached /proc/meminfo`).split(' ')[1]

            mu=mt.to_i - (mf.to_i + mb.to_i + mc.to_i)
            mp=((mu.to_f/mt.to_f) * 100).to_i

            #$mem = "^fg(#{@colors[14]})#{@icons['ram']} ^fg(#{@colors[15]})#{mp}% ^fg(#{@colors[7]})#{toiB(mu*1024)}"
            $mem = "^fg(#{@colors[14]})#{@icons['ram']} ^fg(#{@colors[15]})#{mp}%"

            sleep(3)
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
    end
}

# MPC | On update
@thr << Thread.new {
    begin
        PTY.spawn("mpc idleloop player") do |stdin,stdout,pid|
            begin
                stdin.each { |line|
                    $song = `mpc current`.split("\n")
                    if $song.length > 0
                        $mpd = "^fg(#{@colors[14]})#{@icons['mpd_play']} ^fg(#{@colors[15]})#{$song[0]} "
                    else
                        #$mpd = "^fg(#{@colors[14]})#{@icons['mpd_stop']} ^fg(#{@colors[7]})N/A"
                        $mpd = ""
                    end
                }
            end
        end
    rescue PTY::ChildExited
        puts "MPC process exited!"
    end
}

# Time + Networks + Diskspace + Battery | 30 sec
@thr << Thread.new {
    begin
        while(true)

            @nets.clear
            ifs=(`ls /sys/class/net`).split(' ')
            ifs.each do |idev|
                if idev != 'lo' and (@nets.select {|n| n.name == idev}).length() == 0
                    if File.exist?('/proc/net/wireless')
                        @nets.push(Interface.new(idev,(`grep #{idev} /proc/net/wireless | wc -l`).to_i))
                    else
                        @nets.push(Interface.new(idev,0))
                    end
                end
            end

            # IP And Speed
            @nets.each do |n|
                ip = `ip addr show dev #{n.name}`.match(/^.*inet ([^ ]*).*$/)
                if ip
                    n.ip = (ip[1].to_s.split('/'))[0]

                    if n.wireless == 1
                        stats = `iwconfig #{n.name}`
                        essid = "^fg(#{@colors[7]})#{stats.match(/ESSID:"(.*)"/)[1]}"
                        q = stats.match(/Quality=([0-9]+)\/([0-9]+)/)
                        pq = ((q[1].to_f/q[2].to_f)*100).to_i
                        quality = "^fg(#{@colors[15]})#{pq}% "

                        if pq > 75
                            n.icon = @icons['net_wifi_100']
                        elsif pq > 60
                            n.icon = @icons['net_wifi_75']
                        elsif pq > 45
                            n.icon = @icons['net_wifi_60']
                        elsif pq > 30
                            n.icon = @icons['net_wifi_45']
                        elsif pq > 15
                            n.icon = @icons['net_wifi_30']
                        else
                            n.icon = @icons['net_wifi_15']
                        end

                        n.speed = "#{essid} #{quality}^fg(#{@colors[7]})#{stats.match(/Bit Rate=([0-9]+)/)[1]} Mbs"
                        # n.speed = "#{essid}^fg(#{@colors[7]})"
                    else
                        # if n.name =~ /tun/
                        #     n.icon = @icons['net_vpn']
                        # else
                        #     n.icon = @icons['net_lan']
                        # end

                        n.icon = "#{n.name}:"
                        bps = `cat /sys/class/net/#{n.name}/speed`.to_i
                        n.speed = "^fg(#{@colors[7]})#{bps} Mbs"
                    end
                else
                    n.ip = nil
                end
            end

            # Time
            d=`date +"%H:%M %Y-%m-%d"`.to_s.split(' ')
            $date = "^fg(#{@colors[14]})#{@icons['time']} ^fg(#{@colors[15]})#{d[0]} ^fg(#{@colors[7]})#{d[1]}"
            #$date = "^fg(#{@colors[14]})#{@icons['time']} ^fg(#{@colors[15]})#{d[0]}"

            # Diskspace
            df = ''
            #nf = ''
            d=`df`.split(/\n/)
            d.each() do |dl|
                ds = dl.split(' ')
                if ds[5] =~ /\/(|home)$/
                    dp=((ds[2].to_f/ds[1].to_f) * 100).to_i
                    df += " ^fg(#{@colors[15]})#{ds[5]} #{dp}% ^fg(#{@colors[7]})#{toiB(ds[3].to_i*1024)}"
                end
                #if ds[5] =~ /\/net\/[^\/]*\//
                #dp=((ds[2].to_f/ds[1].to_f) * 100).to_i
                #nf += " ^fg(#{@colors[15]})#{ds[5]} #{dp}% ^fg(#{@colors[7]})#{toiB(ds[3].to_i*1024)}"
                #end
            end
            $df = "^fg(#{@colors[14]})#{@icons['storage']}#{df} "
            #$nf = (nf.length > 0) ? " ^fg(#{@colors[14]})#{@icons['storage_nfs']}#{nf}" : ''

            # Battery
            if File.exists?('/sys/class/power_supply/BAT1')
                pow =`acpi`
                pp = (pow.match(/([0-9]+)%,/)[1]).to_i

                icon = @icons['bat_charge']
                if pow =~ /Discharging/
                    if pp > 60
                        icon = @icons['bat_100']
                    elsif pp > 30
                        icon = @icons['bat_60']
                    else
                        icon = @icons['bat_30']
                    end
                end
                $bat = "^fg(#{@colors[14]})#{icon} ^fg(#{@colors[15]})#{pp}% ^fg(#{@colors[7]})#{pow.match(/%, ([0-9]{2}:[0-9]{2}):[0-9]{2}/)[1]} "
                #$bat = "^fg(#{@colors[14]})#{icon} ^fg(#{@colors[15]})#{pp}% "
            end
            sleep(30)
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
    end
}

# Pacman + Mail + Weather | 60 min
@thr << Thread.new {
    begin
        while(true)
            np = `checkupdates | wc -l`.to_i
            if np > 0
                $pac = "^fg(#{@colors[14]})#{@icons['updates']} ^fg(#{@colors[15]})#{np} "
            else
                #$pac = "^fg(#{@colors[14]})#{@icons['noupdates']} ^fg(#{@colors[7]})No new packages"
                $pac = ""
            end
            we = Net::HTTP.get_response(URI.parse("http://weather.yahooapis.com/forecastrss?w=#{$location}&u=c")).body
            if we
                doc = REXML::Document.new(we)
                doc.elements.each('rss/channel/item/yweather:condition') do |cond|
                    #^fg(#{@colors[7]})#{cond.attributes.get_attribute("text")}

                    case "#{cond.attributes.get_attribute("code")}".to_i
                    when 32,33,34,36
                        wi = @icons['weather_sunny']
                    when 6,9,10,11,12,17,18,35
                        wi = @icons['weather_rain']
                    when 0,1,2,27,28
                        wi = @icons['weather_cloud']
                    when 26,24,23,29,30,44
                        wi = @icons['weather_cloudy']
                    when 3,37,38,39,35
                        wi = @icons['weather_thunder']
                    when 5,7,8,13,14,15,16,42,47
                        wi = @icons['weather_snow']
                    when 19,20,21,22
                        wi = @icons['weather_fog']
                    when 25,41,43
                        wi = @icons['weather_cold']
                    else
                        wi = @icons['nuclear']
                    end

                    $weather = "^fg(#{@colors[14]})#{wi} ^fg(#{@colors[15]})#{cond.attributes.get_attribute("temp")}C ^fg(#{@colors[7]})#{cond.attributes.get_attribute("text")} "
                end
            else
                $weather = ""
            end

            if File.exist?("#{ENV["HOME"]}/conf/gmailbiff")
                m = `~/conf/gmailbiff`.to_i
                if m > 0
                    $mail = "^fg(#{@colors[14]})#{@icons['mail']} ^fg(#{@colors[15]})#{m}^fg(#{@colors[7]}) "
                else
                    #$mail = " ^fg(#{@colors[14]})#{@icons['mail']} ^fg(#{@colors[7]})No new mail "
                    $mail = ""
                end
            end

            sleep(3600)
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
    end
}

# Main loop | 300 ms ■
while ($running)
    $title = `xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d' ' -f5) _NET_WM_NAME 2> /dev/null`.match(/_NET_WM_NAME.*= "(.*)"/)
    $title = ($title) ? $title[1] : ""

    tags = `herbstclient tag_status #{$monitor}`.split("\t")
    $tags = ""
    tags.each do |t|
        tag=(t[1].to_i)-1
        case t[0]
        when "%"; $tags+= "^fg(#{@colors[5]})#{@tags[tag]}^bg()"
        when "#"; $tags+= "^fg(#{@colors[14]})#{@tags[tag]}^bg()"
        when "+"; $tags+= "^fg(#{@colors[14]})#{@tags[tag]}^bg()"
        when "-"; $tags+= "^fg(#{@colors[5]})#{@tags[tag]}^bg()"
        when ":"; $tags+= "^fg(#{@colors[3]})#{@tags[tag]}^bg()"
        when "!"; $tags+= "^fg(#{@colors[1]})#{@tags[tag]}^bg()"
        when "."; $tags+= "^fg(#{@colors[0]})#{@tags[tag]}^bg()"
        end
    end

    left = "#{$tags}^fg(#{@colors[16]})#{$title}"
    right ="#{$cpu} #{$mem} #{$net}#{$df}#{$nf}#{$bat}#{$vol}#{$mpd}#{$mail}#{$pac}#{$weather}#{$date}"

    imgc = right.scan(/\^i[^)]*\)/m).size
    rtext = right.gsub(/\^[^(]*[^)]*\)/m,'')

    $stdout.puts "#{left} ^pa(#{$screen_width - ((rtext.length * $text_width) +
        (imgc * $iconsize))})#{right}"
    $stdout.flush

    sleep(0.3)
end
