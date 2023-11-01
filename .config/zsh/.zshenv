source ~/.config/user-dirs.dirs
path+=~/.local/bin
export \
	XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME \
	ANDROID_USER_HOME=$HOME/.android ANDROID_HOME=$HOME/.android/sdk \
	GNUPGHOME=$XDG_CONFIG_HOME/gnupg \
	DOTNET_CLI_HOME=$XDG_CACHE_HOME/dotnet NUGET_PACKAGES=$XDG_CACHE_HOME/nuget \
	CARGO_HOME=$XDG_CACHE_HOME/cargo RUSTUP_HOME=$XDG_DATA_HOME/rustup \
	GRADLE_USER_HOME=$XDG_CACHE_HOME/gradle \
	GOPATH=$XDG_DATA_HOME/go GOMODCACHE=$XDG_CACHE_HOME/go/mod \
	PYTHONSTARTUP=$XDG_CONFIG_HOME/pythonstartup \
	WINEPREFIX=~/.local/wine \
	LESSHISTFILE=- \
	EDITOR=nano PAGER="bat -p"