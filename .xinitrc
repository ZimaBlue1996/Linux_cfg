[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrandr -s 2880x1800
polybar example &
exec bspwm
