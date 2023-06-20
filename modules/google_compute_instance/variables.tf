variable "project_id" {
  type        = string
  description = "GCP 專案 ID"
}

variable "instance_name" {
  type        = string
  description = "GCE 名稱"
}

variable "machine_type" {
  type        = string
  description = "GCE 類型"
}

variable "instance_zone" {
  type        = string
  description = "GCE 所在區域"
}

variable "instance_tags" {
  type        = list(string)
  description = "GCE 網路標記"
}

variable "instance_labels" {
  type = map(string)
  description = "GCE 標籤"
}

variable "boot_disk_auto_delete" {
  type    = bool
  description = "是否刪除 instance 時，自動刪除開機磁碟"
  default = true
}

variable "boot_disk_image_name" {
  type        = string
  description = "GCE 映像檔名稱"
}

variable "boot_disk_size" {
  type        = number
  description = "GCE 開機磁碟大小 (單位: GB)"
}

variable "attached_disk_enabled" {
  type    = bool
  description = "是否啟用附加磁碟"
  default = false
}

variable "attached_disk_name" {
  type        = string
  description = "GCE 附加磁碟名稱"
  default = ""
}

variable "attached_disk_mode" {
  type        = string
  description = "GCE 附加磁碟模式"
  default = "READ_ONLY"
  validation {
    condition     = contains(["READ_WRITE", "READ_ONLY"], var.attached_disk_mode)
    error_message = "不符合附加磁碟模式的值，請輸入 READ_WRITE 或 READ_ONLY"
  }    
}

variable "attached_disk_source" {
  type        = string
  description = "GCE 附加磁碟來源"
  default = ""
}

variable "network_name" {
  type        = string
  description = "GCE 網路名稱"
}

variable "subnetwork_name" {
  type        = string
  description = "GCE 子網路名稱"
}

variable "nat_ip_enabled" {
  type    = bool
  description = "是否啟用 NAT IP"
  default = false
}

variable "metadata" {
  type = map(string)
  description = "GCE 中繼資料"
}

variable "enable_display" {
  type    = bool
  description = "是否啟用虛擬顯示"
  default = false
}

variable "resource_policies" {
  type        = list(string)
  description = "GCE 資源原則"
}

variable "service_account_email" {
  type        = string
  description = "GCE 服務帳戶電子郵件"
}

variable "service_account_scopes" {
  type        = list(string)
  description = "GCE 服務帳戶範圍"
}

variable "deletion_protection" {
  type    = bool
  description = "是否啟用刪除保護"
  default = false
}

variable "allow_stopping_for_update" {
  type    = bool
  description = "是否允許自動停止後更新"
  default = false
}
