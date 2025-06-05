def my_hook(d):
    if d['status'] == 'downloading':
        print(' Downloading video!')
    if d['status'] == 'finished':
        print(' Downloaded!')

def enter_format():
    print("Enter ID formatting")
    id_format=input()
    return id_format
def save_url(self):
    with open('url.txt', 'a') as f:
        f.write(self)
        f.write("\n")

