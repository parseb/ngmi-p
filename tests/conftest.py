import pytest

from brownie import ZERO_ADDRESS, chain, accounts
from brownie_tokens import MintableForkToken


@pytest.fixture(scope="module")
def DAI():
    dai_addr = "0x6B175474E89094C44Da98b954EedeAC495271d0F"
    dai_token = MintableForkToken(dai_addr)
    return dai_token



@pytest.fixture(scope="module")
def yVault(vault_address):
    pass
