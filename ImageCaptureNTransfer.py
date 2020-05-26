from picamera import PiCamera
import dropbox
import time
import boto3
from botocore.client import Config
from Crypto.Cipher import AES
from Crypto import Random

ACCESS_KEY_ID = 'GIVE YOUR ACCESS KEY'
ACCESS_SECRET_KEY = 'GIVE YOUR SECRET KEY'
BUCKET_NAME = 'raspberryexample'

camera = PiCamera()

camera.start_preview()
for i in range(2):
    time.sleep(1)
    camera.capture('/home/ubuntu/awsCode/foodImage%s.jpg' % i)
    print("Image Captured..")
    
    #Code for Tranfer file to dropbox

    f = open('foodImage%s.jpg' % i)
    dbx = dropbox.Dropbox('xyKhd7gwckAAAAAAAAAALA--5f5qpTmDDYLtB5Qlhh7eKCnFPeKDZtSqgVHo44-u')
    dbx.files_upload(f.read(), '/RaspberryPi/Library/foodImage%s.jpg' % i)
    f.close()
    print("File uploaded on DropBox..")
    
    #code for uplaoding image on AWS

    data = open('foodImage%s.jpg' % i)

    s3 = boto3.resource(
    's3',
    aws_access_key_id=ACCESS_KEY_ID,
    aws_secret_access_key=ACCESS_SECRET_KEY,
    config=Config(signature_version='s3v4')
    )
    s3.Bucket(BUCKET_NAME).put_object(Key='foodImage%s.jpg' % i, Body=data)
    print("Plain File uploaded on AWS..")

    #encrypt image and upload on AWS
    key = Random.new().read(AES.block_size)
    iv = Random.new().read(AES.block_size)

    input_file = open('foodImage%s.jpg' % i)
    input_data = input_file.read()
    input_file.close()

    cfb_cipher = AES.new(key, AES.MODE_CFB, iv)
    enc_data = cfb_cipher.encrypt(input_data)

    enc_file = open('EncFoodImage%s.jpg'%i, "w")
    enc_file.write(enc_data)
    enc_file.close()    
	
    print("Encryption done..")
    
    data = open('EncFoodImage%s.jpg'%i)

    s3 = boto3.resource(
    's3',
    aws_access_key_id=ACCESS_KEY_ID,
    aws_secret_access_key=ACCESS_SECRET_KEY,
    config=Config(signature_version='s3v4')
    )
    s3.Bucket(BUCKET_NAME).put_object(Key='EncFoodImage%s.jpg' % i, Body=data) 
    print("encrypted file uploaded on AWS..")   

camera.stop_preview()	