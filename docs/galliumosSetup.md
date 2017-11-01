Collection of useful articles for setting up GalliumOS as I like it.

=====
EMACS
=====
*Show Column Numbers

    (setq column-number-mode t)

* [tab] inserts two spaces
  https://www.reddit.com/r/emacs/comments/32fqm3/make_tab_2_spaces_in_every_mode/
   
    (setq-default indent-tabs-mode nil)
    (global-set-key "\t" (lambda () (interactive) (insert-char 32 2)))
    (electric-indent-mode 0)



=====
CLEAN
=====
#!/bin/bash
rm *~

===========
KEYBINDINGS
===========
General
https://www.reddit.com/r/GalliumOS/comments/5qj8ql/how_can_i_remap_the_search_key_to_caps_lock/

Spotify Keybindings
https://gist.github.com/jbonney/5743509

Volume Keybindings
Command to lower volume:
amixer set Master 5dB-
Command to raise volume
amixer set Master 5dB+ unmute
(Note that I used "unmute",because, if volume is muted and I press the key to raise volume,then I want that it is  automatically switched to unmuted smile )

==========
BRIGHTNESS
==========
https://askubuntu.com/questions/149054/how-to-change-lcd-brightness-from-command-line-or-via-script
