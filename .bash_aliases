sudo locale-gen es_PE.UTF-8
export LC_ALL=es_PE.UTF-8
export LANG=es_PE.UTF-8
export LANGUAGE=es_PE.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +"%B" | tr A-Z a-z)

alias pull="git pull origin master"
alias push="git push origin master"
alias master="git checkout master"
alias lsbranch="git branch"

function commit() { git add . && git commit -am "$1"; }
function branch() { git checkout "$1"; }
function cbranch() { git checkout -b "$1"; }
function dbranch() { git branch -d "$1"; }

function gomail() { route=/workspace/mailings && cd $route && echo $route | xclip - i; }
function onmail() { route=/workspace/mailings/mailings/optical/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function inmail() { route=/workspace/mailings/mailings/ingenio/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function ulmail() { route=/workspace/mailings/mailings/ultra/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function pomail() { route=/workspace/mailings/mailings/porto/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function vamail() { route=/workspace/mailings/mailings/valtx/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function obmail() { route=/workspace/mailings/mailings/obi/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
#function wimail() { route=C:/xampp/htdocs/win/public/mailing/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function ismail() { route=/workspace/mailings/mailings/isam/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }

function create() { mkdir -p "$1" && cd "$1" && touch "index.mjml" && code -r index.mjml  && echo $(pwd -W) | clip; }

function chtml() { mjml index.mjml -o index.html && mjml index.mjml -o index.txt; }

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

inftp() {
    $(r)
    HOST='190.12.78.250'
    USER='electo@futura.edu.pe'
    PASSWORD='electo#123.'
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://ingenio.edu.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://ingenio.edu.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://ingenio.edu.pe/mailing/$YEAR/$MONTH/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://ingenio.edu.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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

ulftp() {
    $(r)
    HOST='ultra.pe'
    USER='ultra'
    PASSWORD='electO#123._'
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://ultra.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://ultra.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://ultra.pe/mailing/$YEAR/$MONTH/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://ultra.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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

poftp() {
    $(r)
    HOST='porto.legal'
    USER='portolegal'
    PASSWORD='JWhmdrid=pSg'
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://porto.legal/mailing/$YEAR/$MONTH/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
                echo https://porto.legal/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://porto.legal/mailing/$YEAR/$MONTH/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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
        mput *html *.jpg *.png *.pdf *.xlsx
        bye
EOF
            echo https://porto.legal/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
            echo "Se realizó la transferencia con éxito"
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

obftp() {
    $(r)
    HOST='obi.pe'
    USER='obi'
    PASSWORD='Xk#AD2cKTU(T'
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
        cd obi/public/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
                echo https://obi.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
        cd obi/public/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
                echo https://obi.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
        cd obi/public/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://obi.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
        cd obi/public/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput *html *.jpg *.jpeg *.png *.pdf *.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://obi.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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

vassh() {
    $(r)
    HOST='192.141.42.164'
    USER='deploy'
    PORT='2211'
    if [ -n "$2" ]; then
        if [ "$2" = "enero" ] || [ "$2" = "febrero" ] || [ "$2" = "marzo" ] || [ "$2" = "abril" ] || [ "$2" = "mayo" ] || [ "$2" = "junio" ] || [ "$2" = "julio" ] || [ "$2" = "agosto" ] || [ "$2" = "setiembre" ] || [ "$2" = "octubre" ] || [ "$2" = "noviembre" ] || [ "$2" = "diciembre" ]; then

            case "$1" in
            m)
                $(chtml)
                MONTH="$2"
                FILE=${PWD##*/}
                ssh -p$PORT $USER@$HOST "mkdir -p /var/www/html/mailing/$YEAR/$MONTH/$FILE"
                scp -P $PORT *.png *.html *.jpg *.pdf *.xlsx $USER@$HOST:/var/www/html/mailing/$YEAR/$MONTH/$FILE

                echo https://valtx.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
                ssh -p$PORT $USER@$HOST "mkdir -p /var/www/html/mailing/$YEAR/$MONTH/$OLDFILE/$FILE"
                scp -P $PORT *.png *.html *.jpg *.pdf *.xlsx $USER@$HOST:/var/www/html/mailing/$YEAR/$MONTH/$OLDFILE/$FILE
                echo https://valtx.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
            ssh -p$PORT $USER@$HOST "mkdir -p /var/www/html/mailing/$YEAR/$MONTH/$FILE"
            scp -P $PORT *.png *.html *.jpg *.pdf *.xlsx $USER@$HOST:/var/www/html/mailing/$YEAR/$MONTH/$FILE
            echo "Se realizó la transferencia con éxito"
            echo https://valtx.pe/mailing/$YEAR/$MONTH/$FILE | clip
            ;;
        sd)
            $(chtml)
            FILE=${PWD##*/}
            cd ..
            OLDFILE=${PWD##*/}
            cd $FILE
            ssh -p$PORT $USER@$HOST "mkdir -p /var/www/html/mailing/$YEAR/$MONTH/$OLDFILE/$FILE"
            scp -P $PORT *.png *.html *.jpg *.pdf *.xlsx $USER@$HOST:/var/www/html/mailing/$YEAR/$MONTH/$OLDFILE/$FILE

            echo "Se realizó la transferencia con éxito"
            echo https://valtx.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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

issftp() {
    $(r)
    HOST='192.241.168.67'
    USER='root'
    PASSWORD='electoAdmin#123_22'
    if [ -n "$2" ]; then
        if [ "$2" = "enero" ] || [ "$2" = "febrero" ] || [ "$2" = "marzo" ] || [ "$2" = "abril" ] || [ "$2" = "mayo" ] || [ "$2" = "junio" ] || [ "$2" = "julio" ] || [ "$2" = "agosto" ] || [ "$2" = "setiembre" ] || [ "$2" = "octubre" ] || [ "$2" = "noviembre" ] || [ "$2" = "diciembre" ]; then

            case "$1" in
            m)
                $(chtml)
                MONTH="$2"
                FILE=${PWD##*/}
                sftp $USER@$HOST <<EOF
        lcd $PWD
        cd ..
        cd var/www/html/isam.edu.pe/public/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd "$FILE"
        mput $PWD/*.png
        mput $PWD/*.jpg 
        mput $PWD/*.jpeg 
        mput $PWD/*.html 
        mput $PWD/*.pdf
        mput $PWD/*.xlsx
        bye
EOF
                echo https://isam.edu.pe/mailing/$YEAR/$MONTH/$FILE | clip
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
                sftp $USER@$HOST <<EOF
        lcd $PWD
        cd ..
        cd var/www/html/isam.edu.pe/public/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput $PWD/*.png
        mput $PWD/*.jpg 
        mput $PWD/*.jpeg 
        mput $PWD/*.html 
        mput $PWD/*.pdf
        mput $PWD/*.xlsx
        bye
EOF
                echo https://isam.edu.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
            sftp $USER@$HOST <<EOF
        lcd $PWD
        cd ..
        cd var/www/html/isam.edu.pe/public/mailing/$YEAR/$MONTH
        mkdir "$FILE"
        cd $FILE
        mput $PWD/*.png
        mput $PWD/*.jpg 
        mput $PWD/*.jpeg 
        mput $PWD/*.html 
        mput $PWD/*.pdf
        mput $PWD/*.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://isam.edu.pe/mailing/$YEAR/$MONTH/$FILE | clip
            ;;
        sd)
            $(chtml)
            FILE=${PWD##*/}
            cd ..
            OLDFILE=${PWD##*/}
            cd $FILE
            sftp $USER@$HOST <<EOF
        lcd $PWD
        cd ..
        cd var/www/html/isam.edu.pe/public/mailing/$YEAR/$MONTH
        mkdir "$OLDFILE"
        cd "$OLDFILE"
        mkdir "$FILE"
        cd "$FILE"
        mput $PWD/*.png
        mput $PWD/*.jpg 
        mput $PWD/*.jpeg 
        mput $PWD/*.html 
        mput $PWD/*.pdf
        mput $PWD/*.xlsx
        bye
EOF
            echo "Se realizó la transferencia con éxito"
            echo https://isam.edu.pe/mailing/$YEAR/$MONTH/$OLDFILE/$FILE | clip
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
