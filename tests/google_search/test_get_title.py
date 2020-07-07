from webdriver_vault.downloaded_chrome_wd.wd import load_webdriver_f_downloaded_chromewd

class Test:

    def test(self):
        wd = load_webdriver_f_downloaded_chromewd();
        wd.get('https://google.com/')
        assert wd.title == 'Google'
        wd.quit()