# MyEny

I was going to use ansible. However, came across this

> running a playbook against a single device is not a huge efficiency gain over making the same change manually.

So what's the point in using ansible? Will I ever need to set up more than one machins at a time?
I do not see myself setting up several machines at a time. There for I should just create a script
that sets up my environment on a machine.

1. Why do I want or need this?

I want this because I find myself constantly setting up machines with this or that.
For example, I always install an editor such as vim, nvim, and/or emacs.

2. Why are you constantly setting up machines?

Because I use a lot of VMs and I change my personal computer setup often.

3. Why do you use a lot of VMs and why do you want to automate and standardise tools and packages?

I use a lot of VMs at work and personally to sandboxed, develop, or experiment.
I find my self installing the same things often and I want to automate it.

I want to have the same basic tools such as editors across all environments. This way I don't have to fumble around.
I want a standardised basic environment that I can build off of.

4. Why have different things to build off of why not make all environments the exact same?

For one that would take a long time to set up each machine and not every machine needs to have the same tools.
For example, a python dev vm doesn't need Go installed and vice verse. A Go dev vm doesn't need python installed.
I don't need wireless hacking tools on all VMs and I don't need 5+ editors installed on a machine.
Make it modular so that I can mix and match what I want?

5. Why make it modular?

Make it modular so that if I want to create a wireless hacking env I can set one up quickly with just the basics.
If needed I could have a wireless hacking vm set up with dev tools and play around. Or I could have a wireless
hacking vm with all tools and set up as a dev env. It really depends on what I need/want and how much time I want to wait.
Also a lot of the work VMs I want to keep as small as possible and don't need to bloat with 

each module needs to be independant and be able to be built along with others reguardless of order.

## Basic

What is the very basic tool(s) needed?

Why do you need this tool? Why does it NEED to be on every VM

For the most basic setup I would want...or on a fresh system I always end up installing...
vim or nvim and my vim or nvim config

why do I need vim or nvim installed?
All unix distros come with vi installed. However, I want something with a little more power and abilities.
I prefer lvim and it is build on top of nvim. So I think it would be best to install nvim as the very basic
editor. This will give me the power and features I want/need. It is also easy to add a config file for.
This also goes with the modular idea I have. Where I can build on top of it and add lvim later.

Why do I need a different editor than whats installed?
vi is enough for the most basic editing. However, if I want to do more I need more.

Editing is editing what more could you want?
Yes editing is editing. With vi I can still do most things. With vim there is a little more. But with nvim there
is a lot. For example, I find that I use NvimTree a lot now that I use lvim as my editor.

- nvim
    - nvim config
- bash config

## Standard

For a standard set up I want to have lvim as my editor. 
I may also want to have a shell configured and setup in spicific way.
With that what shell do I want? I have been using fish lately. I like it
a lot. However, I find that bash is still the main scripting language and
switch to it a lot. Is this ok or do I want to just stick with bash? macOS
default is zsh and zsh has a lot in common with bash but also has some of the
features I like about fish.

What do I really get from zsh or fish?
For me I really only benifit from the custom prompt. 

How difficult or how much time would it take for me to create a bash prompt like
the ones I like for zsh and fish? 
I don't think it would be difficult. I do think it would be time consuming.

is it really worth my time to do this?
no, I don' think so.


how important is it to have the prompt that I like? What do I get out of it?
If I am making turorials not having the full path visibal is a good idea.
If I am developing having the git information is very helpful. For standard use
it may not be needed at this time.

Oh-my-bash has the agnoster theme. However, it does not have the shortened wd by default.

- lunar vim
    - hack nerd font
    - neovim
    - pip3
    - git
    - zip
    - cargo/rust
    - lvim config

I have chosed kitty over tmux
- kitty

I need to decide if or when to install fish.

## Development

This can be broken down into several different Development environments.
If I am developing in go I don't need python installed.

I really only use emacs now for git
- doomemacs
    - emacs

- python(latest)
    - pipenv
    - pyenv

- go(latest)

- bash
    - shellcheck

- lua


## Wireless

Do all of these tools NEED to be installed or can there be a basic set and an advanced set?

- aircrack-ng
- bettercap
- kismet
- wash
- reaver
- wireshark
- tshark
- iw
- hashcat
- crunch
- john the ripper
- rsmangler
- cowpatty
- hostapd-mana

- bully
- freeradius
- asleap
- airgeddon
- dnsmasq 
- hostapd-wpe 
- hostapd 
- isc-dhcp-server
- mdk4
- hcxdumptool 
- hcxtools 
- beef-xss 
- lighttpd 
- build-essential 
- libssl-dev 
- libpcap-dev 
- xterm 
- asleap
- apache2 
- libapache2-mod-php
- hashcat-utils
- nftables
- hostapd
