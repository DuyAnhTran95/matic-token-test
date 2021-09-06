import { ethers, hardhatArguments } from 'hardhat';
var contracts = require('./MaticContracts.json');

async function main() {
    const network = hardhatArguments.network ? hardhatArguments.network : 'dev';

    const chainManagerProxy: any = contracts[network]['ChildChainManagerProxy'];
    const [deployer] = await ethers.getSigners();
    console.log('deploy from address: ', deployer.address);

    const Token = await ethers.getContractFactory('ChildTestToken');
    const token = await Token.deploy(chainManagerProxy);
    console.log('Child Token address: ', token.address);
}

main().then(() => process.exit(0))
    .catch(err => {
        console.error(err);
        process.exit(1);
    });