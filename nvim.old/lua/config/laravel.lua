require("laravel").setup({
    split = {
      relative = "editor",
      position = "right",
      size = "30%",
      enter = true,
    },
    bind_telescope = false,
    lsp_server = "intelephense",
    register_user_commands = false,
    route_info = {
      enable = true,
      position = "right",
    },
    default_runner = "buffer",
    commands_runner = {
        ["dump-server"] = "persist",
        ["queue:listen"] = "persist",
        ["serve"] = "persist",
        ["websockets"] = "persist",
        ["queue:restart"] = "watch",
        ["tinker"] = "terminal",
        ["db"] = "terminal",
    },
    environment = {
      resolver = require "laravel.environment.resolver"(true, true, nil),
      environments = {
        ["local"] = require("laravel.environment.native").setup(),
        ["sail"] = require("laravel.environment.sail").setup(),
        ["docker-compose"] = require("laravel.environment.docker_compose").setup(),
      },
    },
    resources = {
        ["make:cast"] = "app/Casts",
        ["make:channel"] = "app/Broadcasting",
        ["make:command"] = "app/Console/Commands",
        ["make:component"] = "app/View/Components",
        ["make:controller"] = "app/Http/Controllers",
        ["make:event"] = "app/Events",
        ["make:exception"] = "app/Exceptions",
        ["make:factory"] = function(name)
          return string.format("database/factories/%sFactory.php", name), nil
        end,
        ["make:job"] = "app/Jobs",
        ["make:listener"] = "app/Listeners",
        ["make:mail"] = "app/Mail",
        ["make:middleware"] = "app/Http/Middleware",
        ["make:migration"] = function(name)
          local result = require("laravel.runners").sync { "fd", name .. ".php" }
          if result.exit_code == 1 then
            return "", result.error
          end

          return result.out, nil
        end,
        ["make:model"] = "app/Models",
        ["make:notification"] = "app/Notifications",
        ["make:observer"] = "app/Observers",
        ["make:policy"] = "app/Policies",
        ["make:provider"] = "app/Providers",
        ["make:request"] = "app/Http/Requests",
        ["make:resource"] = "app/Http/Resources",
        ["make:rule"] = "app/Rules",
        ["make:scope"] = "app/Models/Scopes",
        ["make:seeder"] = "database/seeders",
        ["make:test"] = "tests/Feature",
    }
})
