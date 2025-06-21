-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil 

build:; forge build

install:; forge install Cyfrin/foundry-devops@0.1.0 --no-commit && forge install smartcontractkit/chainlink@42c74fcd30969bca26a9aadc07463d1c2f473b8c --no-commit && forge install foundry-rs/forge-std@v1.7.0 --no-commit && forge install transmissions11/solmate@v6 --no-commit

test :; forge test 

deploy-sepolia:
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account sepolia_meta --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
