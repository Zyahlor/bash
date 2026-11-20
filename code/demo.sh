clear
user=$(whoami)
echo "user:$user"
echo "Hôm nay là $(date +%F), kernel $(uname -r)"
echo "Có $(ls | wc -l) file trong thư mục này"
echo "Thư mục cha: $(basename $(dirname $(pwd)))
pwd
dirname "$(pwd)"
basename "$(dirname "$(pwd)")""
