--Metadata
fx_version 'bodacious'
games {'gta5'}

author 'Cr1TiKa7 base of the esx_busjob by Cengizhan & Oguzhan'
description 'ESX Bus Job (Cr1TiKa7 adjustments)'
version '1.3'

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/de.lua',
    'locales/tr.lua',
    'client/main.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
	'@mysql-async/lib/MySQL.lua',
    'locales/en.lua',
    'locales/de.lua',
    'locales/tr.lua',
    'server/server.lua'
}