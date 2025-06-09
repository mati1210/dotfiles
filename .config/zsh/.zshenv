XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_CONFIG_HOME="$HOME/.config"

path=( ~/.local/bin $path )
export \
	XDG_{CONFIG,CACHE,DATA,STATE}_HOME \
	ANDROID_USER_HOME=$HOME/.android ANDROID_HOME=$HOME/.android/sdk \
	GNUPGHOME=$XDG_CONFIG_HOME/gnupg \
	DOTNET_CLI_HOME=$XDG_CACHE_HOME/dotnet NUGET_PACKAGES=$XDG_CACHE_HOME/nuget \
	CARGO_HOME=$XDG_CACHE_HOME/cargo RUSTUP_HOME=$XDG_DATA_HOME/rustup \
	GRADLE_USER_HOME=$XDG_CACHE_HOME/gradle \
	GOPATH=$XDG_DATA_HOME/go GOMODCACHE=$XDG_CACHE_HOME/go/mod \
	FCEUX_HOME=$XDG_CONFIG_HOME/fceux \
	PYTHONSTARTUP=$XDG_CONFIG_HOME/pythonstartup \
	WINEPREFIX=~/.local/wine \
	LESSHISTFILE=- \
	SQLITE_HISTORY=$XDG_STATE_HOME/history/sqlite \
	NODE_REPL_HISTORY=$XDG_STATE_HOME/history/node \
	EDITOR=nano PAGER="bat -p" MANGOHUD=1 \
	RADV_FORCE_VRS=2x2 RADV_DEBUG=novrsflatshading \
	TIME_STYLE=long-iso \
	QT_WAYLAND_RECONNECT=1 \
	clasp_config_auth=$XDG_CONFIG_HOME/clasprc.json

if (( ! $+SSH_AUTH_SOCK )) {
	for sock_path ( $XDG_RUNTIME_DIR/ssh-agent.socket ${PREFIX}/var/run/ssh-agent ) {
		[[ -S $sock_path ]] && export SSH_AUTH_SOCK=$sock_path
	}
}
