fx_version 'bodacious'
game 'gta5'

version '1.0.0'

ui_page 'nui/index.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

files {
	'nui/index.html',
	'nui/js.js',
    'nui/css.css',
	'nui/imagens/*',
	'nui/imagens/*/*',
}