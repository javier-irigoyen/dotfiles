sudo apt install ftp
sudo locale-gen en_PE.UTF-8
export LC_ALL=es_PE.UTF-8
export LANG=es_PE.UTF-8
export LANGUAGE=es_PE.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +"%B" | tr A-Z a-z)

alias pull="git pull origin master"
alias push="git push origin master"
alias master="git checkout master"
alias lsbranch="git branch"

onftp() {
    $(r)
    HOST='promociones.optical.pe'
    USER='promoptical'
    PASSWORD='21M!E3(c.ZP5'
    if [ -n "$2" ]; then
        if [ "$2" = "enero" ] || [ "$2" = "febrero" ] || [ "$2" = "marzo" ] || [ "$2" = "abril" ] || [ "$2" = "mayo" ] || [ "$2" = "junio" ] || [ "$2" = "julio" ] || [ "$2" = "agosto" ] || [ "$2" = "setiembre" ] || [ "$2" = "octubre" ] || [ "$2" = "noviembre" ] || [ "$2" = "diciembre" ]; then

            case "$1" in
            m)
                $(chtml)
                MONTH="$2"
                FILE=${PWD##*/}
                ftp -inv $HOST <<EOF
        bin
        user $USER $PASSWORD
        lcd $PWD
        cd public_html/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
                echo https://promociones.optical.pe/mailing/$YEAR/$MONTH/$FILE | clip
                MONTH=$(date +"%B" | tr A-Z a-z)
                echo "Se realizó la transferencia con éxito"

                ;;

            sd)
                $(chtml)
                MONTH="$2"
                FILE=${PWD##*/}
                cd ..
                OLDFILE=${PWD##*/}
                cd $FILE
                ftp -inv $HOST <<EOF
        bin
        user $USER $PASSWORD
        lcd $PWD
        cd public_html/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
                echo https://promociones.optical.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
                MONTH=$(date +"%B" | tr A-Z a-z)
                echo "Se realizó la transferencia con éxito"
                ;;
            esac

        else
            echo "Por favor, introduzca un mes válido"
        fi
    else
        case "$1" in
        "")
            $(chtml)
            FILE=${PWD##*/}
            ftp -inv $HOST <<EOF
        bin
        user $USER $PASSWORD
        lcd $PWD
        cd public_html/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://promociones.optical.pe/mailing/$YEAR/$MONTH/$FILE | clip
            ;;
        sd)
            $(chtml)
            FILE=${PWD##*/}
            cd ..
            OLDFILE=${PWD##*/}
            cd $FILE
            ftp -inv $HOST <<EOF
        bin
        user $USER $PASSWORD
        lcd $PWD
        cd public_html/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://promociones.optical.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
            ;;
        -h)
            echo -e "onftp: Agrega los archivos al servidor de promociones optical en el mes actual y en la siguiente ruta 'public_html/mailing/[current-year]/[current-month]/[dir]'\nonftp m [month]: Agrega los archivos al servidor de promociones optical en la siguiente ruta 'public_html/mailing/[current-year]/[month]/[dir]'\nonftp sd [month]: Agrega los archivos al servidor creando directorio y subdirectorio en la siguiente ruta 'public_html/mailing/[current-year]/[month]/[dir]/[subdir]'"
            ;;
        *)
            echo "el comando '$1' es incorrecto, por favor introduzca 'onftp', 'onftp m [month]','onftp sd [month]' o 'onftp -h'"
            ;;
        esac
    fi
}