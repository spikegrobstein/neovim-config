return {
  --"nvimdev/dashboard-nvim",
  --config = function()
    ---- figlet -f Bloody neovim
    --local logo = [[
 --███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 --██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
--▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
--▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
--▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
--░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
--░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   --░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
         --░    ░  ░    ░ ░        ░   ░         ░
                                --░
    --]]

    --require("dashboard").setup {
      --config = {
        --header = vim.split(logo, "\n"),
        ----theme = "doom"
      --}
    --}
    ----dashboard.section.header.val = vim.split(logo, "\n")
  --end,
}
