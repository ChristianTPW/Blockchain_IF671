const tokenTest = artifacts.require("tokenTest");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("tokenTest", function (/* accounts */) {
  it("should assert true", async function () {
    await tokenTest.deployed();
    return assert.isTrue(true);
  });

  it("should return total supply of 1000000", async function () {
    const instance = await tokenTest.deployed();
    const totalSupply = await instance.totalSupply();

    assert.equal(total.supply, 1000000);
  });
});
