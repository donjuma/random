import feedparser

PUN_FACTORY = "http://feeds.feedburner.com/PunOfTheDay"

def main():
    punFeed = feedparser.parse(PUN_FACTORY)
    veryFunnyPun = punFeed['entries'][0]['summary']
    evenFunnierPun = veryFunnyPun.partition("<")[0]
    print evenFunnierPun


if __name__ == "__main__": main()
