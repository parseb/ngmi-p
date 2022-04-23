import pytest

from brownie import ZERO_ADDRESS, chain, accounts, NotGonnaMakeIt, Contract
from brownie_tokens import MintableForkToken, ERC20


@pytest.fixture(scope="module")
def DAI():
    dai_addr = "0x6B175474E89094C44Da98b954EedeAC495271d0F"
    dai_token = MintableForkToken(dai_addr)
    dai_token._mint_for_testing(accounts[0], 1_000_000_000 * 10 ** 18)
    return dai_token

#YEARN ARBITRUM REGISTRY JFK 0x3199437193625DCcD6F9C9e98BDf93582200Eb1f

# @pytest.fixture(scope="module")
# def yReg():
#     reg= Contract.from_etherscan("0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804")
    
#yearn registry 0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804
@pytest.fixture(scope="module")
def NGMI():
    n = NotGonnaMakeIt.deploy("0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804",{"from": accounts[0]})
    return n

@pytest.fixture(scope="module")
def y_reg():
    reg= Contract.from_explorer("0x50c1a2eA0a861A967D9d0FFE2AE4012c2E053804")
    return reg
    
@pytest.fixture(scope="module")
def yToken(y_reg):
    v = y_reg.latestVault("0x6B175474E89094C44Da98b954EedeAC495271d0F")
    y = ERC20(v)
    return y
