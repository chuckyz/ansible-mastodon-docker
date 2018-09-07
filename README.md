ansible-mastodon-docker
=========

*currently incomplete* A playbook to deploy mastodon as a docker-compose in a simple, opinionated way to a single server.

Requirements
------------

- docker
- docker-compose
- git

Role Variables
--------------

mastodon_domain: Your domain.  *Required*

mastodon_version: Defaults to v2.5.0, see https://hub.docker.com/r/tootsuite/mastodon/tags/ for versions.

postgres_data_path: The local postgres data path, blank will keep everything in docker.

redis_data_path: The local redis data path, blank will keep everything in docker.

mastodon_path: Defaults to /srv/mastodon

email: A dictionary containing a list of variables associated to SMTP_* vars in the mastodon .env file.  A full list of these is available at https://github.com/tootsuite/mastodon/blob/master/.env.production.sample#L66

email default:
```
email:
  server: "127.0.0.1"
  port: "25"
  from_address: "notification@localhost"
  auth_method: "none"
  openssl_verify_mode: "none"
```

email example (sparkpost):
```
email:
  server: "smtp.sparkpostmail.com"
  port: 587
  login: "my_login"
  password: "my_password"
  auth_method: "plain"
  openssl_verify_mode: "peer"
```

Dependencies
------------

None

Example Playbook
----------------

    - hosts: mastodon
      roles:
         - { 
         	 role: chuckyz.ansible-mastodon, 
         	 mastodon_domain: "mymastodon.fqdn",
         	 postgres_data_path: "/var/lib/mastodon/postgres",
         	 redis_data_path: "/var/lib/mastodon/redis",
         	 email:
		  	   server: "smtp.sparkpostmail.com"
		  	   port: 587
		  	   login: "my_login"
		  	   password: "my_password"
		  	   auth_method: "plain"
		  	   openssl_verify_mode: "peer"
		   }

License
-------

BSD

Author Information
------------------

