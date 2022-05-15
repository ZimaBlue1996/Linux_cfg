#!/bin/bash
# Copyright (c) 2022 LiuHe
DISTRO="unknow"
PM="apt"

Get_Dist_Name()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='dnf'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "ARCH" /etc/issue || grep -Eq "ARCH" /etc/*-release; then
        DISTRO='ARCH'
        PM='pacman'
    else
        DISTRO='unknow'
    fi
    echo 'Current archticture is '$DISTRO;
}
Get_Dist_Name

install_packages() {
    local packages=''
    # basic graphic
    packages+=' xorg xorg-xinit rxvt-unicode '
    # packages+=' xorg-apps xorg-server '
    # window manager
    packages+=' bspwm sxhkd rofi '
    # devlopment tools
    packages+='gcc gdb git '
    # Fonts
    packages+=' ttf-dejavu ttf-liberation '
    # tools
    packages+=' openssh '
    # Misc  
    # packages+=' alsa-utils aspell-en chromium cpupower gvim mlocate net-tools ntp openssh p7zip pkgfile powertop python python2 rfkill rsync sudo unrar unzip wget zip systemd-sysvcompat zsh grml-zsh-config'

    # ucode
    # packages+=' intel-ucode'
    # packages+=' amd-ucode'

    # if [ "$VIDEO_DRIVER" = "i915" ]
    # then
    #     packages+=' xf86-video-intel libva-intel-driver'
    # elif [ "$VIDEO_DRIVER" = "nouveau" ]
    # then
    #     packages+=' xf86-video-nouveau'
    # elif [ "$VIDEO_DRIVER" = "radeon" ]
    # then
    #     packages+=' xf86-video-ati'
    # elif [ "$VIDEO_DRIVER" = "vesa" ]
    # then
    #     packages+=' xf86-video-vesa'
    # fi
    $PM -Sy --noconfirm $packages
}
# install_packages

enable_services() {
    echo 'enable service list:'
    echo '->sshd.service'
    systemctl enable --now sshd.service
}
# enable_services

function cfg_bspwm(){
    echo 'config bspwm'
    mkdir -p /home/he/.config/{bspwm,sxhkd}
    # cp /usr/share/doc/bspwm/examples/bspwmrc  /home/he/.config/bspwm
    # cp /usr/share/doc/bspwm/examples/sxhkdrc  /home/he/.config/sxhkd
    # chmod u+x  ~/.config/bspwm/bspwmrc
    # chmod u+x  ~/.config/sxhkd/sxhkdrc
}
cfg_bspwm