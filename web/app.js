(function merchantCheckoutFile() {
    var MID = 'uPZvfY66447257997053';
    var URL = 'https://knocksense-prod.cartoonmango.com/api/v1/event/191/ticket-payment';
    var merchantCallback = null;
    var createDOMElements = function (input) {
        var scriptEle = document.createElement('script'),
            cssEle = document.createElement('link');

        if (cssEle) {
            cssEle.href = input.style;
            cssEle.rel = 'stylesheet';
            cssEle.type = 'text/css';
            document.head.appendChild(cssEle);
        }
        if (scriptEle) {
            scriptEle.async = true;
            scriptEle.src = input.js;
            scriptEle.type = 'application/javascript';
            scriptEle.crossOrigin = "anonymous";
            scriptEle.onload = function () {
                if (window.CheckoutJS) {
                    if (window.Paytm && window.Paytm.CheckoutJS) {
                        for (var key in window.CheckoutJS) {
                            if (window.CheckoutJS.hasOwnProperty(key)) {
                                window.Paytm.CheckoutJS[key] = window.CheckoutJS[key];
                            }
                        }
                    }
                    try {
                        delete window.CheckoutJS; // remove CheckoutJS from window scope
                    } catch (e) { }
                    if (window.Paytm.CheckoutJS.initLib) {
                        window.Paytm.CheckoutJS.initLib(MID).then(function () {
                            if (merchantCallback) {
                                merchantCallback.call();
                            }
                        });
                    }
                }
            };
            document.body.appendChild(scriptEle);
        }
    };

    var post = function () {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                var data = JSON.parse(this.responseText);
                createDOMElements(data);
            }
        };
        xhr.open('GET', URL, true);
        xhr.setRequestHeader("Content-Type", "application/javascript; charset=utf-8");
        xhr.send(null);
    };

    post();

    if (!window.Paytm) {
        // check if window.Paytm exists or not
        window.Paytm = {};
    }

    window.Paytm.CheckoutJS = {
        onLoad: function (callback) {
            if (!callback || callback.constructor !== Function) {
                throw new Error('callback in onLoad function should be of function type');
            }
            merchantCallback = callback;
        }
    };
    window.Paytm.CheckoutJS.init(config)
        .then(function onSuccess() {
            console.log("Before JS Checkout invoke");
            // after successfully update configuration invoke checkoutjs
            window.Paytm.CheckoutJS.invoke();
        })
        .catch(function onError(error) {
            console.log("Error => ", error);
        });



})();