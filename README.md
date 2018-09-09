ansible-mastodon-docker
=========

A playbook to deploy mastodon as a docker-compose in a simple, opinionated way to a single server.

Note
----

Running `rake` commands (e.g.: `rake mastodon:make_admin`) should be done through docker-compose.

An example would be, while SSH'd as a user with access to docker-compose in `mastodon_path`:

`docker-compose run --rm web -e USER_EMAIL=myuser@email.tld rake mastodon:make_admin`

Dropping to a bash shell is similar to check/run different rake commands:

`docker-compose run --rm web bash`

Then hit enter to drop to shell.

Requirements
------------

- docker
- docker-compose
- git
- letsencrypt (certbot)
- At least 4GB memory (can include swap) for compiling assets

Role Variables
--------------

## Required variables

- `mastodon_domain`: Your domain.

- `letsencrypt_email`: Your email for letsencrypt certificates.

## Optional variables

- `mastodon_version`: Defaults to v2.5.0, see https://hub.docker.com/r/tootsuite/mastodon/tags/ for versions.

- `postgres_data_path`: The local postgres data path, blank will keep everything in docker.

- `redis_data_path`: The local redis data path, blank will keep everything in docker.

- `mastodon_path`: Defaults to /srv/mastodon

- `email`: A dictionary containing a list of variables associated to SMTP_* vars in the mastodon .env file.  A full list of these is available at https://github.com/tootsuite/mastodon/blob/master/.env.production.sample#L66

`email` default:
```
email: {
  server: "127.0.0.1"
  port: "25"
  from_address: "notification@localhost"
  auth_method: "none"
  openssl_verify_mode: "none"
}
```

`email` example (sparkpost):
```
email: {
  server: "smtp.sparkpostmail.com"
  port: 587
  login: "SMTP_Injection"
  password: "my_API_key"
  from_address: "notifications@mymastodon.tld"
}
```

Dependencies
------------

None

Example Playbook
----------------

    - hosts: mastodon
      become: yes
      become_user: root
      roles:
      - { 
         	 role: chuckyz.ansible-mastodon-docker, 
         	 mastodon_domain: "mymastodon.tld",
         	 postgres_data_path: "/var/lib/mastodon/postgres",
         	 redis_data_path: "/var/lib/mastodon/redis",
         	 email: {
              server: "smtp.sparkpostmail.com",
              port: 587,
              login: "SMTP_Injection",
              password: "my_API_key",
              from_address: "notifications@mymastodon.tld"
           }  
		   }

License
-------

BSD

Author Information
------------------

chuckyz