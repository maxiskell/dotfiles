export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# homebrew
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/bin:${PATH}"

# pnpm
export PNPM_HOME="/Users/maxi/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Go
export PATH="/usr/local/go/bin:$PATH"

# jpeg-turbo
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

# For compilers to find jpeg:
export LDFLAGS="-L/opt/homebrew/opt/jpeg/lib"
export CPPFLAGS="-I/opt/homebrew/opt/jpeg/include"

# For pkg-config to find jpeg you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/jpeg/lib/pkgconfig"
