@icons = {
    "cpu" => "cpu:",
    "ram" => "mem:",
    "net_offline" => "net:",
    "net_lan" => "lan:",
    "net_vpn" => "vpn:",
    "net_wifi_100" => "wlan:",
    "net_wifi_75" => "wlan:",
    "net_wifi_60" => "wlan:",
    "net_wifi_45" => "wlan:",
    "net_wifi_30" => "wlan:",
    "net_wifi_15" => "wlan:",
    "net_up" => "up:",
    "net_down" => "down:",
    "net_wan" => "wan:",
    "vol_mute" => "vol:",
    "vol_100" => "vol:",
    "vol_70" => "vol:",
    "vol_40" => "vol:",
    "vol_15" => "vol:",
    "storage" => "hdd:",
    "storage_nfs" => "nfs:",
    "bat_100" => "bat:",
    "bat_60" => "bat:",
    "bat_30" => "bat:",
    "bat_charge" => "bat:",
    "mpd_play" => "mpd:",
    "updates" => "pac:",
    "mail" => "mail:",
    "weather_sunny" => "weather:",
    "weather_rain" => "weather:",
    "weather_cloud" => "weather:",
    "weather_cloudy" => "weather:",
    "weather_thunder" => "weather:",
    "weather_snow" => "weather:",
    "weather_fog" => "weather:",
    "weather_cold" => "weather:",
    "temp" => "C",
    "time" => "time:",
    "nuclear" => "weather:",
    "dot" => "\u25C6",
    "ndot" => "\u25CA"
}

class Interface
    attr_accessor :pul, :pdl, :ul, :dl, :name,
        :speed, :essid, :ip, :wireless, :icon

    def initialize(name, wireless)
        @name = name
        @wireless = wireless
        @pdl = 0
        @pdl = 0
    end
end

def getColor(xrdb,curr,default)
    c = xrdb.match(/\*#{curr}:[\s|\t]*(#.*)/)[1]
    if c
        @colors.push(c)
    else
        @colors.push(default)
    end
end

def procToSym(p,len)
    step = 100/len
    sproc = 0
    output = ''
    for s in 1..len
        sproc += step
        if p.to_i >= sproc.to_i
            output += "\u25C6"
        else
            output += "\u25CA"
        end
    end

    return output
end

def toiB(bytes)
    if bytes / 1099511627776 > 0
        return "#{(bytes.to_f / 1099511627776).round(2)} ^fg(#{@colors[7]})TiB"
    elsif bytes / 1073741824 > 0
        return "#{(bytes.to_f / 1073741824).round(2)} ^fg(#{@colors[7]})GiB"
    elsif bytes / 1048576 > 0
        return "#{(bytes.to_f / 1048576).round(2)} ^fg(#{@colors[7]})MiB"
    end
    #    elsif bytes / 1024 > 0
    return "#{(bytes.to_f / 1024).round(2)} ^fg(#{@colors[7]})KiB"
    #    else
    #        return "#{(bytes.to_f).round(2)} ^fg(#{@colors[7]})BiB"
    #    end
    #    return "\\f01ERR"
end
