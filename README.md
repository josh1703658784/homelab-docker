
Services I use on my home server.

Tailscale is a mesh network to access services remotely and securely. Seriously, check it out. This project sat half-finished for a long time until I found Tailscale.

Used [Trash Guides](https://trash-guides.info) for configuration bootstrapping.

Most everything is off-the-shell `linuxserver.io` and `binhex` for easy deployment.

Tailscale is used for mesh networking. It's awesome. I use the `Docker Mod` feature of `linuxserver.io` containers to easily add Tailscale support to each server. It's a dirty solution but also very easy for getting bootstrapped. /Eventually/ I would like every internal service to have it's own Tailscale sidecar configured like in `compose.tailscale-services.yml`.

The `./dockerfiles` directory should eventually removed. Each custom image should have it's own Docker image and Git repository published.
