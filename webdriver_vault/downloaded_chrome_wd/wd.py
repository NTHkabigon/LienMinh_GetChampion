from selenium import webdriver
import os


def load_webdriver_f_downloaded_chromewd():
    # load CHROMEDRIVER_BINARY
    PWD = os.path.abspath(__file__ + '/..')
    CHROMEDRIVER_BINARY = f'{PWD}/chromedriver'
    if not os.path.isfile(CHROMEDRIVER_BINARY): raise Exception(f'Not found chromedriver binary at {CHROMEDRIVER_BINARY} - you may want to run activate.sh')

    # create wd
    wd = webdriver.Chrome(executable_path=CHROMEDRIVER_BINARY)  # ref. https://stackoverflow.com/a/42478941/248616
    wd.implicitly_wait(20)
    wd.maximize_window()
    return wd
