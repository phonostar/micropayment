# encoding: utf-8

module Micropayment
  class Prepay

    URL = Config::BASE_URL + "prepay/v1.1/nvp/"

    class << self

      def execute(method, data={})
        API.call(URL, method, data)
      end

      def assert_valid_keys(*opts)
        Micropayment.assert_valid_keys *opts
      end

      def assert_keys_exists(*opts)
        Micropayment.assert_keys_exists *opts
      end


      # "ermittelt Konfigurationsparameter"
      def config(options={})
        assert_valid_keys(options, :project)
        assert_keys_exists(options, :project)
        execute(:config, options)
      end

      # "löscht alle Kunden und Transaktionen in der Testumgebung"
      def reset_test
        execute(:resetTest, :testMode => 1)
      end

      # "legt neuen Kunden an"
      def customerCreate(options={})
        assert_valid_keys(options, :customerId, :freeParams)
        assert_keys_exists(options, :customerId)
        execute(:customerCreate, options)
      end

      # "ordnet weitere freie Parameter dem Kunden zu, oder ändert sie"
      def customerSet(options={})
        assert_valid_keys(options, :customerId, :freeParams)
        assert_keys_exists(options, :customerId)
        execute(:customerSet, options)
      end

      # "ermittelt alle freien Parameter des Kunden"
      def customerGet(options={})
        assert_valid_keys(options, :customerId)
        assert_keys_exists(options, :customerId)
        execute(:customerGet, options)
      end

      # "ermittelt alle Kunden"
      def customerList(options={})
        assert_valid_keys(options, :from, :count)
        execute(:customerList, options)
      end

      # "erzeugt oder ändert Adressdaten eines Kunden"
      def addressSet(options={})
        assert_valid_keys(options, :customerId, :form, :firstName, :surName, :address, :street, :zip, :city, :country)
        assert_keys_exists(options, :customerId, :firstName, :surName)
        execute(:addressSet, options)
      end

      # "ermittelt die Adresse des Kunden"
      def addressGet(options={})
        assert_valid_keys(options, :customerId)
        assert_keys_exists(options, :customerId)
        execute(:addressGet, options)
      end

      # "erzeugt oder ändert Kontaktdaten eines Kunden"
      def contactDataSet(options={})
        assert_valid_keys(options, :customerId, :email, :phone, :mobile, :language)
        assert_keys_exists(options, :customerId)
        execute(:contactDataSet, options)
      end

      # "ermittelt die Kontaktdaten des Kunden"
      def contactDataGet(options={})
        assert_valid_keys(options, :customerId)
        assert_keys_exists(options, :customerId)
        execute(:contactDataGet, options)
      end

      # "erzeugt einen neuen Bezahlvorgang"
      # => "löst die Benachrichtigung sessionStatus mit dem Status "INIT" bzw. "REINIT" aus"
      def sessionCreate(options={})
        assert_valid_keys(options, :customerId, :sessionMode, :sessionId, :project, :projectCampaign, :account, :webmasterCampaign, :amount, :currency, :title, :payText, :expireDays, :ip, :freeParams)
        assert_keys_exists(options, :customerId, :project)
        execute(:sessionCreate, options)
      end

      # "ordnet weitere freie Parameter der Session zu, oder ändert sie"
      def sessionSet(options={})
        assert_valid_keys(options, :sessionId, :freeParams)
        assert_keys_exists(options, :sessionId)
        execute(:sessionSet, options)
      end

      # "ermittelt Daten eines Bezahlvorgangs"
      def sessionGet(options={})
        assert_valid_keys(options, :sessionId)
        assert_keys_exists(options, :sessionId)
        execute(:sessionGet, options)
      end

      # "übermittelt alle Bezahlvorgänge eines Kunden"
      def sessionList(options={})
        assert_valid_keys(options, :customerId)
        assert_keys_exists(options, :customerId)
        execute(:sessionList, options)
      end

      # "Veranlasst eine Minderung des Betrags und ggf. eine (Teil-)Gutschrift"
      def sessionChange(options={})
        assert_valid_keys(options, :sessionId, :amount)
        assert_keys_exists(options, :sessionId, :amount)
        execute(:sessionChange, options)
      end

      # "simuliert einen Zahlungeingang für eine oder mehrere Sessions"
      def sessionPayinTest(options={})
        assert_valid_keys(options, :sessionId, :amount, :bankCountry, :bankCode, :accountNumber, :accountHolder)
        assert_keys_exists(options, :sessionId, :amount)
        execute(:sessionPayinTest, options)
      end

      # "simuliert das Auslösen einer Erinnerungsmail"
      # => "löst die Benachrichtigung sessionRemind aus"
      def sessionRemindTest(options={})
        assert_valid_keys(options, :sessionId, :lastRemind)
        assert_keys_exists(options, :sessionId)
        execute(:sessionRemindTest, options)
      end

      # "simuliert den Ablauf einer Session"
      # => "löst die Benachrichtigung sessionStatus mit dem Status "CLOSED" aus"
      def sessionExpireTest(options={})
        assert_valid_keys(options, :sessionId)
        assert_keys_exists(options, :sessionId)
        execute(:sessionExpireTest, options)
      end

      # "simuliert die automatische Rücküberweisung für überzahlte Beträge"
      def sessionRefundTest(options={})
        assert_valid_keys(options, :sessionId)
        assert_keys_exists(options, :sessionId)
        execute(:sessionRefundTest, options)
      end

      # "ermittelt alle Transaktionen für einen Bezahlvorgang"
      def transactionList(options={})
        assert_valid_keys(options, :sessionId)
        assert_keys_exists(options, :sessionId)
        execute(:transactionList, options)
      end

      # "ermittelt Daten einer Transaktion"
      def transactionGet(options={})
        assert_valid_keys(options, :transactionId)
        assert_keys_exists(options, :transactionId)
        execute(:transactionGet, options)
      end

    end

  end
end
