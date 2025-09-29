# Gentoo-overlay

### This repository is intended to be used alongside the official repository. It contains some packages not found in the official repo but is dependant on the official repo.

## `gnome-base/gnome-vanilla` 
|  USE flag | description  |
|---:|---|
| `webkit` | install both `webkit-gtk` and `yelp`. |
| `browser` | install Epiphany (requires `webkit`). |
| `webcam` | install GNOME's `snapshot` camera app. |
| `qemu` | install `gnome-boxes` |   
| `accessiblity` | install `orca` |

## Notes
- As a result of removing many of the patches from the original ebuilds found in the gentoo official repo, this is unlikely to work as expected on openrc systems.
- Gnome-boxes has a circular dependency issue that can be solved by first emerging spice without the smartcard use flag set, then emerging gnome-boxes.
    ```
    # USE="-smartcard" emerge -1a app-emulation/spice
    ```
