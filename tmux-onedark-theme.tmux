#!/bin/bash
darcula_black="#1E1F22"
darcula_blue="#56A8F5"
darcula_yellow="#AFBF7E"
darcula_orange="#CC7832"
darcula_red="#FA6675"
darcula_white="#cdd0d3"
darcula_green="#6AAB73"
darcula_visual_grey="#2b2d30"
darcula_comment_grey="#7A7E85"


get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$darcula_white"
set "message-bg" "$darcula_black"

set "message-command-fg" "$darcula_white"
set "message-command-bg" "$darcula_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$darcula_black"
setw "window-status-bg" "$darcula_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$darcula_black"
setw "window-status-activity-fg" "$darcula_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

fade_inactive_panes=$(get "@darcula_fade_inactive_panes" "true")
if [ "$fade_inactive_panes" = "true" ]; then
   set "window-style" "fg=$darcula_comment_grey"
else
   set "window-style" "fg=$darcula_white"
fi
set "window-active-style" "fg=$darcula_white"

set "pane-border-fg" "$darcula_white"
set "pane-border-bg" "$darcula_black"
set "pane-active-border-fg" "$darcula_yellow"
set "pane-active-border-bg" "$darcula_black"

set "display-panes-active-colour" "$darcula_yellow"
set "display-panes-colour" "$darcula_blue"

set "status-bg" "$darcula_black"
set "status-fg" "$darcula_white"

set "@prefix_highlight_fg" "$darcula_black"
set "@prefix_highlight_bg" "$darcula_yellow"
set "@prefix_highlight_copy_mode_attr" "fg=$darcula_black,bg=$darcula_yellow"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@darcula_widgets")
time_format=$(get "@darcula_time_format" "%R")
date_format=$(get "@darcula_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$darcula_white,bg=$darcula_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$darcula_visual_grey,bg=$darcula_black]#[fg=$darcula_visual_grey,bg=$darcula_visual_grey]#[fg=$darcula_white, bg=$darcula_visual_grey]${status_widgets} #[fg=$darcula_comment_grey,bg=$darcula_visual_grey,nobold,nounderscore,noitalics]#[fg=$darcula_black,bg=$darcula_comment_grey,bold] #h #[fg=$darcula_comment_grey, bg=$darcula_comment_grey]#[fg=$darcula_comment_grey,bg=$darcula_comment_grey]"
set "status-left" "#[fg=$darcula_black,bg=$darcula_comment_grey,bold] #S #{prefix_highlight}#[fg=$darcula_comment_grey,bg=$darcula_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$darcula_black,bg=$darcula_black,nobold,nounderscore,noitalics]#[fg=$darcula_white,bg=$darcula_black] #I  #W #[fg=$darcula_black,bg=$darcula_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$darcula_black,bg=$darcula_visual_grey,nobold,nounderscore,noitalics]#[fg=$darcula_white,bg=$darcula_visual_grey,nobold] #I  #W #[fg=$darcula_visual_grey,bg=$darcula_black,nobold,nounderscore,noitalics]"
