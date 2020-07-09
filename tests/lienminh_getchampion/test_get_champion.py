import time

from webdriver_vault.downloaded_chrome_wd.wd import load_webdriver_f_downloaded_chromewd


class Test:

    def test(self):
        wd = load_webdriver_f_downloaded_chromewd()
        url = 'https://universe.leagueoflegends.com/en_US/'

        wd.get(url)
        wd.find_element_by_xpath('//*[@id="riotbar-navbar"]/div[2]/a').click()
        q = "/html/body/div[1]/div/div[2]/div/article/div[2]/ul/li"
        champion_list = wd.find_elements_by_xpath(q)

        for champion in champion_list:
            champion_name = champion.text
            print(champion_name)
        wd.quit()