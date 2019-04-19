all: create_proxy_network up_proxy up_website up_rcc

down: down_rcc down_website down_proxy delete_proxy_network

create_proxy_network:
	-docker network create webproxy

delete_proxy_network:
	-docker network rm webproxy

up_proxy:
	docker-compose -f docker-compose-proxy.yaml up -d

down_proxy:
	docker-compose -f docker-compose-proxy.yaml down

logs_proxy:
	docker-compose -f docker-compose-proxy.yaml --tail=50 -f

up_rcc:
	docker-compose -f docker-compose-rcc.yaml up -d

down_rcc:
	docker-compose -f docker-compose-rcc.yaml down

logs_rcc:
	docker-compose -f docker-compose-rcc.yaml --tail=50 -f

up_website:
	docker-compose -f docker-compose-website.yaml up -d

down_website:
	docker-compose -f docker-compose-website.yaml down

logs_website:
	docker-compose -f docker-compose-website.yaml --tail=50 -f
