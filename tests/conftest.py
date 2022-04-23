import pytest

from brownie import ZERO_ADDRESS, chain, accounts, NotGonnaMakeIt, Contract
from brownie_tokens import MintableForkToken


@pytest.fixture(scope="module")
def DAI():
    dai_addr = "0x6B175474E89094C44Da98b954EedeAC495271d0F"
    dai_token = MintableForkToken(dai_addr)
    return dai_token



# @pytest.fixture(scope="module")
# def yReg():
#     reg= Contract.from_etherscan("0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804")
    
#yearn registry 0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804
@pytest.fixture(scope="module")
def NGMI():
    n = NotGonnaMakeIt.deploy("0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804",{"from": accounts[0]})
    return n
    

