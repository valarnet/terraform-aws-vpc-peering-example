# terraform-aws-vpc-peering-example
This is a simple example of using terraform to create an AWS VPC peering

![image](https://user-images.githubusercontent.com/7331481/176961373-a2c89f79-e2d8-4cf6-84ff-17e66da30f61.png)

What are the requirements?
- Create the required resources in the diagram above.
- ALLOW “subnet-a-to-subnet-a” or “subnet-b-to-subnet-b” communication across the peering. Application servers on the left can communicate with their database counterparts on the other side.
- DENY “subnet-a-to-subnet-b” or “subnet-b-to-subnet-a” communication across the peering. Application servers on the left cannot access databases that do not correspond to them.
