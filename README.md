# Customer-Loyalty-Scheme-over-Tezos
A Loyalty Reward system implemented using Contracts on the Tezos platform.

## Details :
* The Contracts have been written using **Liquidity**.
* The **Loyalty Contract** is deployed first and the contract address is then provided as an argument to the constructor of the Merchant Contract.
* The Customer can send Tezos to the Merchant Contract which then forwards the loyalty rewards to the Loyalty Contract.
* The Customer can call **Refund** on the Merchant Contract by specifying the id of the transaction.
(The customer does not need to interact with the Loyalty Contract for refund).
* In the Liquidity IDE, the above is implemented by using parameters `Refund {{id}}` where id is the transaction id provided by the customer.
* In case of refund, the Merchant Contract sends the balance of the specified transaction to the Loyalty contract and the Loyalty Contract then refunds the entire value of the transaction(including the loyalty) to the customer.

## Contract Testing
The contracts have already been deployed on **AlphaNet**(test network) and the functionality can be checked using the Liquidity IDE (http://www.liquidity-lang.org/edit/).
```
Loyalty Contract  :  TZ1Wrw4cyY9o7LHdPa1giAixW8Ca4qCdw6wN
Merchant Contract :  TZ1afLcPoYLPPZ7vYnn5QQ1vp94cAQNvsTc4
```
(The code for the contract that you are interacting with needs to be present in the editor.)

## Further Work
* Addition of security checks.
* Multi-customer functionality.
