#!/bin/bash
# https://alkusin.net/voidlinux

echo -ne "\e[H\e[2J" > /etc/issue
echo -ne "\e[2m" >> /etc/issue
tee -a /etc/issue >/dev/null << "EOF"
\s \r (\l)

EOF
echo -e "\e[0;32m                  __.;=====;.__" >> /etc/issue
echo -e "              _.=+==++=++=+=+===;." >> /etc/issue
echo -e "               -=+++=+===+=+=+++++=_" >> /etc/issue
echo -e "          .     -=:\`\`     \`--==+=++==." >> /etc/issue
echo -e "         _vi,    \`            --+=++++:" >> /etc/issue
echo -e "        .uvnvi.       _._       -==+==+." >> /etc/issue
echo -e "       .vvnvnI\`    .;==|==;.     :|=||=|." >> /etc/issue
echo -e "  \e[1;32m+QmQQm\e[0;32mpvvnv; \e[1;32m_yYsyQQWUUQQQm #QmQ#\e[0;32m:\e[1;32mQQQWUV\$QQm." >> /etc/issue
echo -e "   -QQWQW\e[0;32mpvvo\e[1;32mwZ?.wQQQE\e[0;32m==<\e[1;32mQWWQ/QWQW.QQWW\e[0;32m(: \e[1;32mjQWQE" >> /etc/issue
echo -e "    -\$QQQQmmU\'  jQQQ\@\e[0;32m+=<\e[1;32mQWQQ)mQQQ.mQQQC\e[0;32m+;\e[1;32mjWQQ\@'" >> /etc/issue
echo -e "     -\$WQ8Y\e[0;32mnI:   \e[1;32mQWQQwgQQWV\e[0;32m\`\e[1;32mmWQQ.jQWQQgyyWW\@!\e[0;32m" >> /etc/issue
echo -e "       -1vvnvv.     \`~+++\`        ++|+++" >> /etc/issue
echo -e "        +vnvnnv,                 \`-|===" >> /etc/issue
echo -e "         +vnvnvns.           .      :=-" >> /etc/issue
echo -e "          -Invnvvnsi..___..=sv=.     \`" >> /etc/issue
echo -e "            +Invnvnvnnnnnnnnvvnn;." >> /etc/issue
echo -e "              ~|Invnvnvvnvvvnnv}+\`" >> /etc/issue
echo -e "                  -~|{*l}*|~\e[0m" >> /etc/issue
echo -e "\e[0m" >> /etc/issue
echo -e " " >> /etc/issue
echo -e " " >> /etc/issue

