# This is temporary until we can pull it from inside hanzo or auto generate this

module.exports =
  data: {
    '@context': 'hanzo.ai/schema'
    '@type': 'Website'
    header: {
      '@type': 'WebsiteHeader'
      type: 'complex'
      logos: [
        {
          '@type': 'WebsiteLogo'
          image: '/img/logo.svg'
          alt: 'HALCYON BIO'
          url: 'https://halcyon.bio'
        }
      ]
      menuCollections: [
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'BENEFITS'
              url: '#benefits'
            }
            {
              '@type': 'WebsiteMenu'
              name: 'INGREDIENTS'
              url: '#ingredients'
            }
            {
              '@type': 'WebsiteMenu'
              name: 'REVIEWS'
              url: '#reviews'
            }
            {
              '@type': 'WebsiteMenu'
              name: 'SIGN IN'
              url: '/login'
            }
      #       {
      #         '@type': 'WebsiteMenu'
      #         name: 'Developers'
      #         links: [
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'API'
      #             # image: '/img/test-rocket.svg'
      #             url: 'https://docs.hanzo.io/reference'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Javascript SDK'
      #             # image: '/img/test-rocket.svg'
      #             url: 'https://github.com/hanzo-io/hanzo.js'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Open Source'
      #             # image: '/img/test-rocket.svg'
      #             url: 'https://github.com/hanzo-io/'
      #           }
      #         ]
      #       }
      #       {
      #         '@type': 'WebsiteMenu'
      #         name: 'Company'
      #         links: [
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Team'
      #             # image: '/img/test-rocket.svg'
      #             url: '#'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Press'
      #             # image: '/img/test-rocket.svg'
      #             url: '#'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Partners'
      #             # image: '/img/test-rocket.svg'
      #             url: '#'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Careers'
      #             # image: '/img/test-rocket.svg'
      #             url: '#'
      #           }
      #           {
      #             '@type': 'WebsiteMenuLink'
      #             name: 'Contact'
      #             url: '#'
      #           }
      #         ]
      #       }
      #       # {
      #       #   '@type': 'WebsiteMenu'
      #       #   name: 'Pricing'
      #       #   url: '#'
      #       # }
          ]
        }
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'ORDER NOW'
              url: '#order-now'
            }
          ]
        }
      ]
    }
    main: []
    footer: {
      '@type': 'WebsiteFooter'
      logos: [
        # {
        #   '@type': 'WebsiteLogo'
        #   # image: '/img/logo.png'
        #   # alt: 'YOUR SITE'
        #   name: 'YOUR SITE '
        #   url: '/'
        # }
        {
          '@type': 'WebsiteLogo'
          image: 'http://hanzo.ai/img/logo.png'
          alt: 'Powered by Hanzo'
          name: 'Powered by Hanzo'
          url: 'http://www.hanzo.ai'
        }
      ]
      menuCollections: [
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'Menu 1'
              links: [
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 1'
                  description: 'This is Link 1'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 2'
                  description: 'This is Link 2'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 3'
                  description: 'This is Link 3'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
              ]
            }
          ]
        }
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'Menu 2'
              links: [
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 1'
                  description: 'This is Link 1'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 2'
                  description: 'This is Link 2'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
                {
                  '@type': 'WebsiteMenuLink'
                  name: 'Link 3'
                  description: 'This is Link 3'
                  # image: '/img/test-rocket.svg'
                  url: ''
                }
              ]
            }
          ]
        }
        # {
        #   '@type': 'WebsiteMenuCollection'
        #   menus: [
        #     {
        #       '@type': 'WebsiteMenu'
        #       name: 'Solutions'
        #       links: [
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Analytics'
        #           url: 'analytics'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Commerce'
        #           url: 'commerce'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Marketing'
        #           url: 'marketing'
        #         }
        #       ]
        #     }
        #   ]
        # }
        # {
        #   '@type': 'WebsiteMenuCollection'
        #   menus: [
        #     {
        #       '@type': 'WebsiteMenu'
        #       name: 'Developers'
        #       links: [
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'API'
        #           # description: 'Lorem Descriptio'
        #           # image: '/img/test-rocket.svg'
        #           url: 'https://docs.hanzo.io'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Javascript SDK'
        #           # description: 'Lorem Descriptio'
        #           # image: '/img/test-rocket.svg'
        #           url: 'https://github.com/hanzo-io/hanzo.js'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Open Source'
        #           # description: 'Lorem Descriptio'
        #           # image: '/img/test-rocket.svg'
        #           url: 'https://github.com/hanzo-io/'
        #         }
        #       ]
        #     }
        #   ]
        # }
        # {
        #   '@type': 'WebsiteMenuCollection'
        #   menus: [
        #     {
        #       '@type': 'WebsiteMenu'
        #       name: 'Company'
        #       links: [
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Team'
        #           # image: '/img/test-rocket.svg'
        #           url: '#'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Press'
        #           # image: '/img/test-rocket.svg'
        #           url: '#'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Partners'
        #           # image: '/img/test-rocket.svg'
        #           url: '#'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Careers'
        #           # image: '/img/test-rocket.svg'
        #           url: '#'
        #         }
        #         {
        #           '@type': 'WebsiteMenuLink'
        #           name: 'Contact'
        #           url: '#'
        #         }
        #       ]
        #     }
        #   ]
        # }
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'Support'
              url: ''
            }
          ]
        }
        {
          '@type': 'WebsiteMenuCollection'
          menus: [
            {
              '@type': 'WebsiteMenu'
              name: 'Call to Action'
              url: '/'
            }
          ]
        }
        # {
        #   '@type': 'WebsiteMenuCollection'
        #   menus: [
        #     {
        #       '@type': 'WebsiteMenu'
        #       name: 'Sign In'
        #       url: 'https://dash.hanzo.io'
        #     }
        #   ]
        # }
      ]
    }
  }
