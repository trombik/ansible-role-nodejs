# ansible-role-nodejs

Install `nodejs` and `npm` packages.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `nodejs_package` | Package name of `nodejs` | `{{ __nodejs_package }}` |
| `nodejs_npm_package` | Package name of `npm` (ignored if platform is OpenBSD) | `{{ __nodejs_npm_package }}` |


## Debian

| Variable | Default |
|----------|---------|
| `__nodejs_package` | `nodejs` |
| `__nodejs_npm_package` | `npm` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__nodejs_package` | `www/node` |
| `__nodejs_npm_package` | `www/npm` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__nodejs_package` | `node` |
| `__nodejs_npm_package` | `""` |

## RedHat

| Variable | Default |
|----------|---------|
| `__nodejs_package` | `nodejs` |
| `__nodejs_npm_package` | `npm` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - name: trombik.redhat-repo
      when: ansible_os_family == 'RedHat'
    - ansible-role-nodejs
  vars:
    redhat_repo:
      epel:
        mirrorlist: "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-{{ ansible_distribution_major_version }}&arch={{ ansible_architecture }}"
        gpgcheck: yes
        enabled: yes
```

# License

```
Copyright (c) 2018 Tomoyuki Sakurai <y@trombik.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <y@trombik.org>

This README was created by [qansible](https://github.com/trombik/qansible)
