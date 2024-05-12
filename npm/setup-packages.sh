setup_packages() {
  # npm - pnpm
  nvm install 'lts/*'
  nvm alias default 'lts/*'
  npm i -g pnpm
  pnpm i -g wrangler eas-cli firebase-tools nx surge

  # deno
  deno install -Arf jsr:@deno/deployctl
}