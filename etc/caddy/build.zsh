exts=(
	#--with=github.com/mholt/caddy-webdav
	--with=github.com/caddy-dns/cloudflare
	--with=github.com/aksdb/caddy-cgi/v2
	--with=github.com/mholt/caddy-l4
)

xcaddy build $exts
