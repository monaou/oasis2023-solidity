const fs = require('fs');

// Type your own PUBLIC key in here

async function main() {
  const DinoRunner = await ethers.getContractFactory("StageContract");
  const dinoRunner = await DinoRunner.deploy();

  await dinoRunner.deployed();
  console.log("Dino Runner contract deployed to:", dinoRunner.address);

  // アドレスをオブジェクトとして作成
  const addressObject = {
    dinoRunnerAddress: dinoRunner.address
  };

  // JSON形式でオブジェクトを文字列に変換
  const jsonData = JSON.stringify(addressObject, null, 2);

  // JSONデータをファイルに書き込む
  fs.writeFileSync('dinoRunnerAddress.json', jsonData);

  console.log("Dino Runner address saved to: dinoRunnerAddress.json");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
