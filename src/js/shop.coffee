import Shop from 'shop.js/src'
import 'el-controls/src/controls/recaptcha'
import $ from 'zepto-modules/_min'

window.raf = requestAnimationFrame

settings =
  # live key
  # key: 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJiaXQiOjQ1MDM2MTcwNzU2NzUxNzIsImp0aSI6Ii1YdHE0cHJVdDNrIiwic3ViIjoiTzVUQWtKcjBzZSJ9.4N1r2FxixxCh4DkGMGA_Iqg4VCNgFOK36Pd-3Zt1BXcqhbUFahU-CnfbeM7eIb01udcvGE2yPQRjAH2DjpRRcA'


  # test key
  key: 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJiaXQiOjQ1MDM2MTcwNzU2NzUxNzYsImp0aSI6IkdxaUZ4dlFhZ1VJIiwic3ViIjoiTzVUQWtKcjBzZSJ9.E7Lc69XRmz-tq1U42aFqECLtcx_pv4w5NTGWeXqoLbM-o-uHcuM_2xS4_kJifA8LXIlLm2tx2M-CmJMdmeZuzA'
  processor: 'authorizenet'
  referralProgram:
    id: 'gQtb0m4FprDyN'

m = Shop.start settings

$('.add-to-cart button').on 'click', (e)->
  m.trigger 'checkout-open'

# account page stuff
if window.location.pathname.indexOf('account') >= 0

  # logout if account isn't logged in
  if !Shop.client.client.customerToken
    window.location.replace '/login'

  # print errors
  m.on 'profile-load-failed', (err)->
    console.log err.stack

  m.on 'profile-load-success', (data)->
    # affiliate only stuff
    # if data.affiliateId && data.affiliate.enabled
    #   $('.referrals.ambassador').addClass('show')

if window.location.pathname.indexOf('signup') >= 0
  m.on 'register', ->
  m.on 'register-success', ->
    window.location.replace 'account'
  m.on 'register-failed', ->

if window.location.pathname.indexOf('login') >= 0
  m.on 'login', ->
  m.on 'login-success', ->
    window.location.replace 'account'
  m.on 'login-failed', ->



