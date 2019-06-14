all: create_proxy_network 
	docker-compose -f docker-compose-rcc.yaml -f docker-compose-proxy.yaml -f docker-compose-website.yaml -f docker-compose-shield.yaml up -d

down:
	docker-compose -f docker-compose-rcc.yaml -f docker-compose-proxy.yaml -f docker-compose-website.yaml -f docker-compose-shield.yaml down --remove-orphans -v
	$(MAKE) delete_proxy_network

create_proxy_network:
	-docker network create webproxy

delete_proxy_network:
	-docker network rm webproxy

up_proxy:
	docker-compose -f docker-compose-proxy.yaml up -d

down_proxy:
	docker-compose -f docker-compose-proxy.yaml down

logs_proxy:
	docker-compose -f docker-compose-proxy.yaml logs --tail=50 -f

up_rcc:
	docker-compose -f docker-compose-rcc.yaml up -d

down_rcc:
	docker-compose -f docker-compose-rcc.yaml down

logs_rcc:
	docker-compose -f docker-compose-rcc.yaml logs --tail=50 -f

up_website:
	docker-compose -f docker-compose-website.yaml up -d

down_website:
	docker-compose -f docker-compose-website.yaml down

logs_website:
	docker-compose -f docker-compose-website.yaml logs --tail=50 -f

up_shield:
	docker-compose -f docker-compose-shield.yaml up -d

down_shield:
	docker-compose -f docker-compose-shield.yaml down

logs_shield:
	docker-compose -f docker-compose-shield.yaml logs --tail=50 -f
