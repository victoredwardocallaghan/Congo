
module GSMCommon where

data GSMBand = GSM850 | EGSM900 | DCS1800 | PCS1900 deriving (Show)

instance Enum GSMBand where
  fromEnum = fromJust . flip lookup table
  toEnum = fromJust . flip lookup (map swap table)

table = [(GSM850, 45000), (EGSM, 45000), (DCS1800, 95000), (PCS1900, 80000)]


-- unsigned GSM::uplinkFreqKHz(GSMBand band, unsigned ARFCN)
-- {
-- 	switch (band) {
-- 		case GSM850:
-- 			assert((ARFCN>=128)&&(ARFCN<=251));
-- 			return 824200+200*(ARFCN-128);
-- 		case EGSM900:
-- 			if (ARFCN<=124) return 890000+200*ARFCN;
-- 			assert((ARFCN>=975)&&(ARFCN<=1023));
-- 			return 890000+200*(ARFCN-1024);
-- 		case DCS1800:
-- 			assert((ARFCN>=512)&&(ARFCN<=885));
-- 			return 1710200+200*(ARFCN-512);
-- 		case PCS1900:
-- 			assert((ARFCN>=512)&&(ARFCN<=810));
-- 			return 1850200+200*(ARFCN-512);
-- 		default:
-- 			assert(0);
-- 	}
-- }
--
-- unsigned GSM::uplinkOffsetKHz(GSMBand band)
-- {
-- 	switch (band) {
-- 		case GSM850: return 45000;
-- 		case EGSM900: return 45000;
-- 		case DCS1800: return 95000;
-- 		case PCS1900: return 80000;
-- 		default: assert(0);
-- 	}
-- }
--
-- unsigned GSM::downlinkFreqKHz(GSMBand band, unsigned ARFCN)
-- {
-- 	return uplinkFreqKHz(band,ARFCN) + uplinkOffsetKHz(band);
-- }
