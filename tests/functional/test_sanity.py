
import pytest
from brownie import accounts, Contract, ZERO_ADDRESS, chain
from brownie_tokens import ERC20, MintableForkToken



def test_mint_dai(DAI):
    assert 1+ 1 == 2
    assert DAI.balanceOf(accounts[0]) == 0 

    DAI._mint_for_testing(accounts[0], 1_000 * 10 ** 18)
    chain.mine(1)
    assert DAI.balanceOf(accounts[0]) == 1_000 * 10 ** 18
    

def hasOwner():
    pytest.skip

def deposits():
    pytest.skip

def test_has_yToken():
    pytest.skip
    #yToken = ERC20(get return value from )

def test_dead_swith():
    pytest.skip

def test_future_yield():
    pytest.skip

def test_has_stream():
    pytest.skip

def test_stream_degraded():
    pytest.skip

def test_finality():
    pytest.skip

def test_gnosis_safe():
    pytest.skip
    
