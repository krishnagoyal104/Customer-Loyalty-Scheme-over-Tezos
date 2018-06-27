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

## Screenshots
\
The Customer pays the Merchant Contract 10 tezos.
\
![Alt text](Screens/pic1.PNG?raw=true)
\
The Merchant Contract stores 9 Tezos, updates the mapping and forwards the rest to the Loyalty Contract.
\
![Alt text](Screens/pic2.PNG?raw=true)
\
The Loyalty Contract stores 1 tezo and updates the mapping.
\
![Alt text](Screens/pic3.PNG?raw=true)
\
The customer calls the Merchant Contract for refund of the 1st transaction.
\
![Alt text](Screens/pic4.PNG?raw=true)
\
The Merchant Contract forwards the 9 Tezos to the Loyalty Contract which then refunds the Customer with all the 10 tezos and the balance decreases to 0.
\
![Alt text](Screens/pic5.PNG?raw=true)

## Further Work
* Addition of security checks.
* Multi-customer functionality.
