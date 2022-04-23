
import pytest
from brownie import accounts, Contract, ZERO_ADDRESS, chain, NotGonnaMakeIt
from brownie_tokens import ERC20, MintableForkToken



def test_mint_dai(DAI):
    assert 1+ 1 == 2
    assert DAI.balanceOf(accounts[0]) == 0 

    DAI._mint_for_testing(accounts[0], 1_000 * 10 ** 18)
    chain.mine(1)
    assert DAI.balanceOf(accounts[0]) == 1_000 * 10 ** 18
    

def test_hasOwner(NGMI):
    o = NGMI.owner()
    assert o == accounts[0]

def test_sets_will_deposits(DAI, NGMI):
    DAI.transfer(accounts[1], 1_000 * 10 ** 18, {"from": accounts[0]})
    DAI.approve(NGMI.address, 1_000 * 10 ** 18, {"from": accounts[1]})
    ngmi_response = NGMI.setWill(DAI.address,  [accounts[8], accounts[9]], [2,3],10**18, 100 * 86400, {"from": accounts[1]})

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
    
