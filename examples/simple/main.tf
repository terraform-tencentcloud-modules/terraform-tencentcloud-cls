provider "tencentcloud" {
  region = "ap-shanghai"
}
module "cls" {
  source = "../../"

  logset_name = "ys-test-logset"
  logset_tags = {
    test="ys"
  }

  topic_name = "ys-test-topic"
  //partition_count = 10
  auto_split = false
  max_split_partitions = 40
  storage_type = "cold"
  period = 15
  topic_tags = {
    test="ys"
  }

  rule = [{
    full_text = [{
      case_sensitive = false
      tokenizer = "test"
      contain_z_h=false
    }]
    key_value = []
    tag=[]
  }]
}