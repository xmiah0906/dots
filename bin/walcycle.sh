#! /bin/sh
#=======================================#
#	pywal script.	#
#=======================================#
# Refresh bspwm's colorscheme.
source "${HOME}/.cache/wal/colors.sh"

bspc config normal_border_color $color0
bspc config focused_border_color $color2
bspc config active_border_color $color3
bspc config presel_feedback_color $color3
