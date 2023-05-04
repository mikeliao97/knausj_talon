os: mac
-

notes [<user.text>]$:
    key("ctrl-4")
    user.switcher_focus("obsidian")
    user.obsidian_open_note(text or "", 0)

notes daily:
    user.switcher_focus("obsidian")
    user.obsidian_run_command("daily today daily")
