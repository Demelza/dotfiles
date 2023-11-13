# Created by newuser for 5.9
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=50000
PROMPT="%F{000}%K{002} %T %F{002}%K{006}%F{000}%K{006} %m %F{006}%K{001}%F{000}%K{001} %~ %F{001}%K{000}"$'\n'"%F{000}%K{003} %n ➜ %F{003}%K{000} %F{015}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias nekofetch="neofetch --os_arch off --cpu_brand off --cpu_temp C --refresh_rate on --gpu_brand off"

nekoimg() {
	local folder=""
	local quality=""
	local size=""
	local color=""
	case "$1" in
		--sage)
			folder="Sage"
			quality="40"
			size="1440x1920"
			color="Gray"
			;;
        --glohd)
            folder="GloHD"
            quality="40"
            size="1072x1448"
            color="Gray"
            ;;
        --laptop)
            folder="Laptop"
            quality="100"
            size="1920x1080"
            color="sRGB"
            ;;
        --desktop)
            folder="Desktop"
            quality="100"
            size="3840x2160"
            color="sRGB"
            ;;
		*)
    esac
    shift

    cd /home/neko/Hentai/Upscale/ && for i in */; do
        mkdir -p "../${folder}/${i%/}" && cd "${i%/}" && mogrify -quality $quality -resize $size\> -format jpg -colorspace $color -path "../../${folder}/${i%/}" *.* && cd ..;
    done
}

alias nekoimg=nekoimg

nekocbz() {
	local folder=""
	case "$1" in
		--sage)
			folder="Sage"
			;;
        --glohd)
            folder="GloHD"
            ;;
        --laptop)
            folder="Laptop"
            ;;
        --desktop)
            folder="Desktop"
            ;;
		*)
    esac
    shift

    cd /home/neko/Hentai/${folder}/ && for i in */; do
        zip -r -9 "../${folder}cbz/${i%/}.cbz" "$i";
    done
}

alias nekocbz=nekocbz
