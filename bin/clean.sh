#!/usr/bin/env bash

rm -rf $HOME/.cache/mozilla/firefox/j1ho1fst.VoidLinux/safebrowsing/*
rm -rf $HOME/.cache/mozilla/firefox/j1ho1fst.VoidLinux/startupCache/*
rm -rf $HOME/.cache/mozilla/firefox/j1ho1fst.VoidLinux/cache2/entries/*
rm $HOME/.cache/mozilla/firefox/j1ho1fst.VoidLinux/*.json
rm $HOME/.mozilla/firefox/j1ho1fst.VoidLinux/places.sqlite

############################################################

rm -rf  ~/.cache/spotify/Browser/Cache/*
rm -rf ~/.cache/spotify/Data/*
rm -rf ~/.cache/thumbnails/neofetch/*
rm -rf ~/.cache/thumbnails/normal/*
rm $HOME/.local/share/recently-used.xbel
rm -f ~/.config/mpv/watch_later/*
rm -rf ~/.local/share/fff/trash/*

# Chrome cace
rm -r ~/.cache/google-chrome/Default/Cache/*
