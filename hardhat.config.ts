import "hardhat-typechain";
import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-ethers";
import * as dotenv from "dotenv";
dotenv.config({path: __dirname+"/.env"});


module.exports = {
    solidity: {
        compilers: [
            {
                version: "0.7.5"
            }
        ]
    },
    networks: {
        dev: {
            url: "http://localhost:8545",
            gasPrice: 20,
            accounts: {
                mnemonic: process.env.MNEMONIC,
                count: 10
            },
            saveDeployments: true,
        },
        bsctest: {
            url: "https://data-seed-prebsc-2-s2.binance.org:8545/",
            accounts: [process.env.PRIV_KEY],
            gasPrice: 10000000000,
            blockGasLimit: 1000000
        },
        goerli: {
            url: "https://goerli.infura.io/v3/" + process.env.INFURA_KEY,
            accounts: [process.env.PRIV_KEY],
        },
        rinkeby: {
            url: "https://rinkeby.infura.io/v3/" + process.env.INFURA_KEY,
            accounts: [process.env.PRIV_KEY],
        },
        ethmainnet: {
            url: "https://mainnet.infura.io/v3/" + process.env.INFURA_KEY,
            accounts: [process.env.PRIV_KEY],
        },
        mumbai: {
            url: "https://rpc-mumbai.matic.today",
            accounts: [process.env.PRIV_KEY]
        }
    },

    etherscan: {
        apiKey: process.env.API_KEY
    }
};